using System.Collections.Generic;

namespace $rootnamespace$.Models.UmbracoIdentity
{
    public class RoleManagementModel
    {
        public IEnumerable<string> AvailableRoles { get; set; }
        public IEnumerable<string> AssignedRoles { get; set; }
    }
}
