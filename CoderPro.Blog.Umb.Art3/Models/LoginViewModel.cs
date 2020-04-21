using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CoderPro.Blog.Umb.Art3.Models
{
    public class LoginViewModel
    {
        public LoginViewModel(string username, string password, string returnUrl)
        {
            Username = username;
            Password = password;
            ReturnUrl = returnUrl;
        }

        public LoginViewModel()
        {

        }

        [Required]
        [DisplayName("Email Address")]
        [DataType(DataType.EmailAddress)]
        public string Username { get; set; }

        [Required]
        [DisplayName("Password")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [DataType(DataType.Url)]
        public string ReturnUrl { get; set; }
    }
}