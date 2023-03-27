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
		// "SELECT * from clients where email = '$email' and password = md5('$password') ";
		$qry = $this->conn->query("SELECT * from clients where email = '$email' and password = '$hash_password' ");

		if ($qry->num_rows > 0) {
			foreach ($qry->fetch_array() as $k => $v) {
				$this->settings->set_userdata($k, $v);
			}
			$this->settings->set_userdata('login_type', 1);
			$resp['status'] = 'success';
		} else {
			$resp['status'] = 'incorrect';
		}

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