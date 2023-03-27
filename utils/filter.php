<?php
define('REGEX_MD5_MATCH', '/^[a-f0-9]{32}$/i');

// show page 404 when required_diff_empty true
/**
 * @param string $data The input string to filter.
 * @param bool $required_diff_empty `false` is default. Required value after filter different empty. If true stop and include page `404.html`.
 * @return string Returns a string match with regex defined.
 */
function filterHashMd5($data, $required_diff_empty = false)
{
    if (preg_match(REGEX_MD5_MATCH, $data)) {
        return $data;
    } elseif (empty($data) && $required_diff_empty == true) {
        include '404.html';
        return '';
    } else {
        return '';
    }
}


/**
 * @param string $data The input string to escape.
 * @return string Returns a string.
 */
function escape_string($data)
{
    $escape_array = array(
        "'" => "\'",
        '"' => '\"',
        ")" => "\)",
        "(" => "\(",
        "--" => "",
        "#" => ""
    );

    return str_replace(array_keys($escape_array), $escape_array, $data);
}

?>