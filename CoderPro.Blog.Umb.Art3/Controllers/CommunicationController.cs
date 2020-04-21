// --------------------------------------------------------------------------------------------------------------------
// <copyright file="CommunicationController.cs" company="Unique Software Development">
//   Copyright 2019 Unique Software Development, Inc.
// </copyright>
// <summary>
//   The communication controller controls all actions relating to communications (System.Net).
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace CoderPro.Blog.Umb.Art3.Controllers
{
    using System.Net.Mail;
    using System.Web.Mvc;

    using global::Umbraco.Web.Mvc;

    /// <summary>
    /// The communication controller.
    /// </summary>
    public class CommunicationController : SurfaceController
    {
        public void Index()
        {
        }

        /// <summary>
        /// The send contact message.
        /// </summary>
        /// <param name="contactModel">
        /// The contact model.
        /// </param>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public void SendContactMessage(Models.ContactViewModel contactModel)
        {
            var success = false;

            if (ModelState.IsValid)
            {
                var smtpClient = new System.Net.Mail.SmtpClient("localhost", 25);

                // Send message to us.
                smtpClient.Send(new MailMessage()
                {
                    Body = contactModel.Message,
                    From = new MailAddress(contactModel.ToEmailAddress, $"{ contactModel.FirstName } { contactModel.LastName }"),
                    To = { new MailAddress(contactModel.FromEmailAddress) },
                    IsBodyHtml = false,
                    Subject = @"Contact Us Form Response"
                });

                // Send thank you to user.
                smtpClient.Send(new MailMessage()
                                    {
                                        Body = @"Thank you for your message! We will get back to you in the next 24 hours.",
                                        From = new MailAddress(contactModel.ToEmailAddress, $"{ contactModel.FirstName } { contactModel.LastName }"),
                                        To = { new MailAddress(contactModel.FromEmailAddress) },
                                        IsBodyHtml = false,
                                        Subject = @"Thank You For Your Message!"
                                    });

                success = true;
            }

            // The point of this exercise is to show you how to create a surface controller, not teach MVC.
            // This is obviously incredibly ugly from an MVC / C# point of view.
            Response.Redirect($"~/contact/?success={success}", false);
        }
    }
}