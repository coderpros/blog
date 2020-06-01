namespace CoderPro.Blog.Umb.Art4.Models
{
    using System.ComponentModel.DataAnnotations;
    public class ContactViewModel
    {
        [MinLength(2), MaxLength(25)]
        [Required]
        [DataType(DataType.Text)]
        public string FirstName { get; set; }

        [MinLength(2), MaxLength(50)]
        [Required]
        [DataType(DataType.Text)]
        public string LastName { get; set; }

        [MinLength(5), MaxLength(100)]
        [Required]
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        public string FromEmailAddress { get; set; }

        [MinLength(5), MaxLength(100)]
        [Required]
        [DataType(DataType.EmailAddress)]
        [EmailAddress]
        public string ToEmailAddress { get; set; }

        [MinLength(8), MaxLength(2000)]
        [Required]
        [DataType(DataType.MultilineText)]
        public string Message { get; set; }
    }
}