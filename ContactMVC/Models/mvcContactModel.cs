using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ContactMVC.Models
{
    public class mvcContactModel
    {
        public int Contactid { get; set; }

        [Required (ErrorMessage ="This is required")]
        public string FirstName { get; set; }
        public string LastName { get; set; }        
        public string Email { get; set; }
        public Nullable<long> PhoneNumber { get; set; }

        [Required(ErrorMessage = "This is required select True")]
        public Nullable<bool> Status { get; set; }
    }
}