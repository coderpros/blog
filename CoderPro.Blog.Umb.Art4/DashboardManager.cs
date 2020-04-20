// --------------------------------------------------------------------------------------------------------------------
// <copyright file="DashboardManager.cs" company="">
//   
// </copyright>
// <summary>
//   Defines the DashboardManager type.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace USD.Umbraco.Article3.UI
{
    using global::Umbraco.Core;
    using global::Umbraco.Core.Composing;
    using global::Umbraco.Web;
    using global::Umbraco.Web.Dashboards;

    /// <summary>
    /// The dashboard manager.
    /// </summary>
    [RuntimeLevel(MinLevel = RuntimeLevel.Run)]
    public class DashboardManager : IUserComposer
    {
        /// <summary>
        /// The compose.
        /// </summary>
        /// <param name="composition">
        /// The composition.
        /// </param>
        public void Compose(Composition composition)
        {
            composition.Dashboards().Remove<FormsDashboard>();
        }
    }
}