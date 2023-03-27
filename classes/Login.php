<?php
require_once '../config.php';
require "../utils/filter.php";

class Login extends DBConnection
{
	private $settings;
	public function __construct()
	{
		global $_settings;
		$this->settings = $_settings;

		parent::__construct();
		ini_set('display_error', 1);
	}
	public function __destruct()
	{
		parent::__destruct();
	}
	public function index()
	{
		echo "<h1>Access Denied</h1> <a href='" . base_url . "'>Go Back.</a>";
	}
	public function login()
	{
		extract($_POST);

		// verify captcha
		if (!isset($_POST["g-recaptcha-response"])) {
			// request required have param g-recaptcha-response, if not return failed.
			$resp['status'] = 'error';
			$resp['message'] = 'Recaptcha Error.';
			return json_encode($resp);
		} else {
			// check reCaptcha valid
			$secret_key = "6Ld1bS8lAAAAAFr0-YPNL96Q8XPDID4Q0iwQeUbh";
			$ip = $_SERVER['REMOTE_ADDR'];
			$response = $_POST["g-recaptcha-response"];
			$url = "https://www.google.com/recaptcha/api/siteverify?secret=$secret_key&response=$response&remoteip=$ip";
			$check = file_get_contents($url);
			$data_response = json_decode($check);
			if ($data_response->success != "true") {
				$resp['status'] = 'error';
				$resp['message'] = 'Vui lòng chọn reCaptcha';
				return json_encode($resp);
			}
		}

		// check input email/password
		if (!isset($username) || !isset($password)) {
			$resp['status'] = 'error';
			$resp['message'] = 'Vui lòng nhập email và password.';
			return json_encode($resp);
		}

		$username = escape_string($username);
		$hash_password = md5($password);
		$qry = $this->conn->query("SELECT * from users where username = '$username' and password = '$hash_password' ");
		if ($qry->num_rows > 0) {
			foreach ($qry->fetch_array() as $k => $v) {
				if (!is_numeric($k) && $k != 'password') {
					$this->settings->set_userdata($k, $v);
				}
			}
			$this->settings->set_userdata('login_type', 1);
			return json_encode(array('status' => 'success'));
		} else {
			// return json_encode(array('status' => 'incorrect', 'last_qry' => "SELECT * from users where username = '$username' and password = md5('$password') "));
			return json_encode(array('status' => 'incorrect'));
		}
	}
	public function logout()
	{
		if ($this->settings->sess_des()) {
			redirect('admin/login.php');
		}
	}

	function login_user()
	{
		extract($_POST);

		// verify captcha
		if (!isset($_POST["g-recaptcha-response"])) {
			// request required have param g-recaptcha-response, if not return failed.
			$resp['status'] = 'error';
			$resp['message'] = 'Recaptcha Error.';
			return json_encode($resp);
		} else {
			// check reCaptcha valid
			$secret_key = "6Ld1bS8lAAAAAFr0-YPNL96Q8XPDID4Q0iwQeUbh";
			$ip = $_SERVER['REMOTE_ADDR'];
			$response = $_POST["g-recaptcha-response"];
			$url = "https://www.google.com/recaptcha/api/siteverify?secret=$secret_key&response=$response&remoteip=$ip";
			$check = file_get_contents($url);
			$data_response = json_decode($check);
			if ($data_response->success != "true") {
				$resp['status'] = 'error';
				$resp['message'] = 'Vui lòng chọn reCaptcha';
				return json_encode($resp);
			}
		}

		// check input email/password
		if (!isset($email) || !isset($password)) {
			$resp['status'] = 'error';
			$resp['message'] = 'Vui lòng nhập email và password.';
			return json_encode($resp);
		} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$resp['status'] = 'error';
			$resp['message'] = 'Email không hợp lệ.';
			return json_encode($resp);
		}

		$hash_password = md5($password);

		$qry = $this->conn->query("SELECT * from clients where email = '$email'");

		if ($qry->num_rows <= 0) {
			$resp['status'] = 'incorrect';
			return json_encode($resp);
		}

		foreach ($qry->fetch_assoc() as $k => $v) {
			$$k = $v;
		}

		// check failed >= 10 and compare last login time with current time (>= 5 minitue)
		// define current time
		$current_time = new DateTime('now');
		$last_login_time = new DateTime($last_login);

		$interval = $current_time->diff($last_login_time);
		$minutes = $interval->format('%i');

		// check time
		if ($count_failed >= 5 && $minutes < 10) {
			$resp['status'] = 'error';
			$after_time = 10 - $minutes;
			$resp['message'] = "Login sai nhiều lần, vui lòng thử lại sau $after_time phút.";
			return json_encode($resp);
		}

		// continue check password correct => incorrect update last_login and count_failed to database
		$last_login = $current_time->format('Y-m-d H:i:s');

		if ($hash_password != $password) {
			$count_failed += 1;
			$sql_update = "UPDATE `clients` SET last_login = '$last_login', count_failed=$count_failed where email='$email'";
			$this->conn->query($sql_update);

			$resp['status'] = 'incorrect';
			return json_encode($resp);
		} else {
			$count_failed = 0;
			$sql_update = "UPDATE `clients` SET last_login = '$last_login', count_failed=$count_failed where email='$email'";
			$this->conn->query($sql_update);
		}

		$this->settings->set_userdata("id", $id);
		$this->settings->set_userdata("firstname", $firstname);
		$this->settings->set_userdata("lastname", $lastname);
		$this->settings->set_userdata("gender", $gender);
		$this->settings->set_userdata("contact", $contact);
		$this->settings->set_userdata("email", $email);
		$this->settings->set_userdata("password", $password);
		$this->settings->set_userdata("default_delivery_address", $default_delivery_address);
		$this->settings->set_userdata("date_created", $date_created);
		$this->settings->set_userdata("last_login", $last_login);

		$resp['status'] = 'success';
		return json_encode($resp);
	}
}

$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$auth = new Login();
switch ($action) {
	case 'login':
		echo $auth->login();
		break;
	case 'login_user':
		echo $auth->login_user();
		break;
	case 'logout':
		echo $auth->logout();
		break;
	default:
		echo $auth->index();
		break;
}