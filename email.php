<html>
    <head>
        <title>Success</title>
        <link rel="apple-touch-icon-precomposed" sizes="57x57" href="icon/apple-touch-icon-57x57.png" />
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="icon/apple-touch-icon-114x114.png" />
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="icon/apple-touch-icon-72x72.png" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="icon/apple-touch-icon-144x144.png" />
        <link rel="apple-touch-icon-precomposed" sizes="60x60" href="icon/apple-touch-icon-60x60.png" />
        <link rel="apple-touch-icon-precomposed" sizes="120x120" href="icon/apple-touch-icon-120x120.png" />
        <link rel="apple-touch-icon-precomposed" sizes="76x76" href="icon/apple-touch-icon-76x76.png" />
        <link rel="apple-touch-icon-precomposed" sizes="152x152" href="icon/apple-touch-icon-152x152.png" />
        <link rel="icon" type="image/png" href="icon/favicon-196x196.png" sizes="196x196" />
        <link rel="icon" type="image/png" href="icon/favicon-96x96.png" sizes="96x96" />
        <link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32" />
        <link rel="icon" type="image/png" href="icon/favicon-16x16.png" sizes="16x16" />
        <link rel="icon" type="image/png" href="icon/favicon-128.png" sizes="128x128" />
        <meta name="application-name" content="&nbsp;"/>
        <meta name="msapplication-TileColor" content="#FFFFFF" />
        <meta name="msapplication-TileImage" content="mstile-144x144.png" />
        <meta name="msapplication-square70x70logo" content="mstile-70x70.png" />
        <meta name="msapplication-square150x150logo" content="mstile-150x150.png" />
        <meta name="msapplication-wide310x150logo" content="mstile-310x150.png" />
        <meta name="msapplication-square310x310logo" content="mstile-310x310.png" />

        
        <link rel='stylesheet' type='text/css' href='stylesheet.css'>
        <link rel='stylesheet' type='text/css' href='mastercss.css'>
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="HandheldFriendly" content="true">
    </head>
    <body bgcolor="black">
        <center><div style="width: 90%;" align="center">
            <center><img src="banner2.png" alt="downloadmp3andalbums" style="background-size: cover; width: 90%; height: 90%;"></center>            
                <div style="width: 90%;" class="topnav" id="myTopnav">
                        <a href="master.html">Home</a>
                        <a href="news.html">News</a>
                        <a href="download.html">Download</a>
                        <a href="batches.html">Batches</a>
                        <a href="request.html">Request</a>
                        <a href="about.html">About</a>
                        <a href="contact.html">Contact</a>                         
                        <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>                    
                    </div>
            </div>                
<?php

function post_captcha($user_response) {
        $fields_string = '';
        $fields = array(
            'secret' => '6LdQBykUAAAAAAFLT1DLgp_ccXGVpEor-Z-S-Njh',
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
?>
     
        <h2 style="color: white; font-family: calibri;">Please go back and make sure you check the security CAPTCHA box.</h2><br>
		                   
<?php
		
    } else {
		
if(isset($_POST['email'])) {
 
    $email_to = "blackcattunes@gmail.com";
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
<h2 style="color: white; font-family: calibri; font-size: large;">Thank you for contacting us. We will be in touch with you very soon.</h2>
<?php
    }
    }
?>
	
	<div align="center" style="color: white; width: 90%; font-size: small;">
                <footer>&copy; 2017 BlackCatTunes. All rights reserved.</footer>
                </div>
        </center>    
    <script>
            function myFunction() {
            var x = document.getElementById("myTopnav");
            if (x.className === "topnav") {
                x.className += " responsive";
            } else {
                x.className = "topnav";
            }
        }
</script>
    </body>
</html>