function email()


clc;

gmail = input('Gmail address: ', 's');
appPass = input('Password: ', 's');
toEmail = input('Destination email: ', 's');
imgPath = input('Image path to attach: ', 's');

if ~isfile(imgPath)
    error("File not found: %s", imgPath);
end

subject = 'Part 4';
message = 'Attached image.';

% --- email preferences ---
setpref('Internet','E_mail', gmail);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username', gmail);
setpref('Internet','SMTP_Password', appPass);

% ---  Gmail SSL (port 465) ---
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class','javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
props.setProperty('mail.smtp.port','465');

% --- Send email with attachment ---
sendmail(toEmail, subject, message, imgPath);

fprintf('\n✅ Email sent successfully to %s\n', toEmail);
end