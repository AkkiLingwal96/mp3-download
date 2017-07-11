<?php

function post_captcha($user_response) {
        $fields_string = '';
        $fields = array(
            'secret' => '6LcYvCgUAAAAAEIr2bpnBQvAWGy9Zzbo_Wh_igBl',
            'response' => $user_response
        );
        foreach($fields as $key=>$value)
        $fields_string .= $key . '=' . $value . '&';
        $fields_string = rtrim($fields_string, '&');

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://www.google.com/recaptcha/api/siteverify');
        curl_setopt($ch, CURLOPT_POST, count($fields));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, True);

        $result = curl_exec($ch);
        curl_close($ch);

        return json_decode($result, true);
    }

    // Call the function post_captcha
    $res = post_captcha($_POST['g-recaptcha-response']);

    if (!$res['success']) {
        // What happens when the CAPTCHA wasn't checked
        echo '<h2 style="color: white; font-family: calibri;">Please go back and make sure you check the security CAPTCHA box.</h2><br>';
		
		
    } else {
		
if(isset($_POST['email'])) {
 
    $email_to = "mygaragesounds@gmail.com";
     $email_subject = "Contact";
 
    $name = $_POST['name']; // required
    $email_from = $_POST['email']; // required
    $comments = $_POST['msg']; // required
	$subject = $_POST['subject']; //required
  
    $email_message = "Form details below.\n\n";
 
     
    function clean_string($string) {
      $bad = array("content-type","bcc:","to:","cc:","href");
      return str_replace($bad,"",$string);
    }
 
     
 
    $email_message .= "Name: ".clean_string($name)."\n";
    $email_message .= "Email: ".clean_string($email_from)."\n";
    $email_message .= "Subject: ".clean_string($subject)."\n";
    $email_message .= "Comments: ".clean_string($comments)."\n";
 
// create email headers
$headers = 'From: '.$email_from."\r\n".
'Reply-To: '.$email_from."\r\n" .
'X-Mailer: PHP/' . phpversion();
@mail($email_to, $email_subject, $email_message, $headers);  
?>
 

 
<h2 style="color: white; font-family: calibri;">Thank you for contacting us. We will be in touch with you very soon. </h2>
 
<?php
}
}
?>