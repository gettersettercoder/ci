
<?php

class Utility
{
    
    public $skey = "COLLEGEAPP_PRODUCT-CRTD16092016\0";
                    
    function encodeText($value, $removeTags = false)
    {
        if (is_array($value)) {
            foreach ($value as $k => $v) {
                $val = $removeTags ? strip_tags($v) : $v;
                $val = addslashes($val);
                $value [$k] = $val;
            }
        }
        else {
            $value = $removeTags ? strip_tags($value) : $value;
            $value = addslashes($value);
        }
        return $value;
    }

    function decodeText($value, $htmlEntity = true)
    {
        if (is_array($value)) {
            foreach ($value as $k => $v) {
                $val = stripslashes($v);
                $value [$k] = $htmlEntity ? htmlentities($val) : $val;
            }
        }
        elseif (is_object($value)) {
            foreach ($value as $k => $v) {
                $val = stripslashes($v);
                $value->$k = $htmlEntity ? htmlentities($val) : $val;
            }
        }
        else {
            $value = stripslashes($value);
            $value = $htmlEntity ? htmlentities($value) : $value;
        }
        return $value;
    }

    public function safe_b64encode($string)
    {
        $data = base64_encode($string);
        $data = str_replace(array(
            '+',
            '/',
            '='
        ), array(
            '-',
            '_',
            ''
        ), $data);
        return $data;
    }

    public function safe_b64decode($string)
    {
        $data = str_replace(array(
            '-',
            '_'
        ), array(
            '+',
            '/'
        ), $string);
        $mod4 = strlen($data) % 4;
        if ($mod4) {
            $data .= substr('====', $mod4);
        }
        return base64_decode($data);
    }

    public function encode($value)
    {
       
        $text = $value;
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
        $crypttext = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $this->skey, $text, MCRYPT_MODE_ECB, $iv);
        return trim($this->safe_b64encode($crypttext));
    }

    public function decode($value)
    {
       
        $crypttext = $this->safe_b64decode($value);
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
        $decrypttext = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $this->skey, $crypttext, MCRYPT_MODE_ECB, $iv);
        return (trim($decrypttext));
    }

    public function setFlashMessage($type, $message)
    {
        $CI = & get_instance();
        $template = '<div class="alert alert-' . $type . ' alert-dismissible text-center showhide" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						   <span aria-hidden="true" class="close_padding">&times;</span>
							</button>' . $message . '</div>';
        
        $CI->session->set_flashdata("myMessage", $template);
    }


   
    
}

?>
