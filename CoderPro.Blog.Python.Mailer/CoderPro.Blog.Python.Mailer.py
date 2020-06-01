from datetime import date
from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import csv
import sqlite3
import threading 
import email, smtplib, ssl
import datetime
import os

class main:
    def __init__(self):
        super().__init__()

        self.email_server = "smtp.gmail.com"
        self.email_port = 465
        self.email_fromAddress = "coderpros81@gmail.com"
        self.email_toAddress = "coderpros81@gmail.com"
        self.email_password = "betterTomorrow81"
        self.email_subject = "Daily Time Report"
        self.attachment_filename = f"DailyTimeReport_{datetime.datetime.now().strftime('%Y%M%d')}.csv"

        self.execution_time = "00:00"
        self.temp_file = "D:\DeleteMe\out.csv"

        monitorThread = threading.Timer(1.0, lambda:self.monitor()).start()

    # Subroutine responsible for converting data into csv format.
    def generateCsv(self, fileName):
        connection = sqlite3.connect('employee.db')
        employees = connection.execute("SELECT * FROM employe;")
        
        with open(fileName, "w", newline='') as csv_file:
            csv_writer = csv.writer(csv_file)
            csv_writer.writerow([i[0] for i in employees.description]) # Write header
            csv_writer.writerows(employees)

        employees.close()
        connection.close()
   
    def monitor(self):
        if datetime.datetime.now().strftime("%H:%M") == self.execution_time:
            if os.path.exists(self.temp_file):
                self.generateCsv(self.temp_file)
                self.send(self.temp_file, self.attachment_filename)

                # All done, so delete the file.
                os.remove(self.temp_file)
            else:
                raise FileNotFoundError(f'Your temp file ({self.temp_file}) does not exist.')

        monitorThread = threading.Timer(60.0, lambda:self.monitor()).start()

    # Subroutine responsible for sending the email.
    def send(self, fileName, attatchmentFileName):

        body = 'Attached, you will find the hours for ' + date.today().strftime('%m/%d/%Y')

        message = MIMEMultipart()

        message["From"] = self.email_fromAddress
        message["To"] = self.email_toAddress
        message["Subject"] = self.email_subject
        
        message.attach(MIMEText(body, "plain"))
               
        # Open file in binary mode.
        with open(fileName, "rb") as attachment:
            # Add file as application/octet-stream
            # Email client can usually download this automatically as attachment
            part = MIMEBase("application", "octet-stream")
            part.set_payload(attachment.read())

        encoders.encode_base64(part)

        # Add header as key/value pair to attachment part
        part.add_header(
            "Content-Disposition",
            f"attachment; filename= {attatchmentFileName}",
        )

        message.attach(part)
        text = message.as_string()

        with smtplib.SMTP_SSL(self.email_server, self.email_port) as server:
            server.login(self.email_fromAddress, self.email_password)
            server.sendmail(self.email_fromAddress, self.email_toAddress, text)

start = main()