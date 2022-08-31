// --------------------------------------------------------------------------------------------------------------------
// <copyright file="Connectivity.cs" company="coderPro.net">
//   Copyright 2022 coderPro.net. All rights reserved.
// </copyright>
// <summary>
//   Defines the Connectivity type.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace CoderPro.Blog.Networking
{
    using System.Net.NetworkInformation;

    /// <summary>
    /// The connectivity object.
    /// </summary>
    public static class Connectivity
    {
        /// <summary>
        /// The host up function pings a host.
        /// </summary>
        /// <param name="host">
        /// The host (domain or IP).
        /// </param>
        /// <returns>
        /// The <see cref="bool">up/down status</see>.
        /// </returns>
        public static bool HostUp(string host)
        {
            var pingable = false;
            Ping pinger = null;

            try
            {
                pinger = new Ping();
                var reply = pinger.Send(host);

                pingable = reply.Status == IPStatus.Success;
            }
            catch (PingException)
            {
                // Discard PingExceptions and return false;
            }
            finally
            {
                pinger?.Dispose();
            }
            
            return pingable;
        }

        /// <summary>
        /// The ping host function pings a host (domain or IP address).
        /// </summary>
        /// <param name="host">
        /// The host.
        /// </param>
        /// <returns>
        /// The ping reply.<see cref="PingReply"/>.
        /// </returns>
        public static PingReply PingHost(string host)
        {
            PingReply reply = null;
            Ping pinger = null;

            try
            {
                pinger = new Ping();
                reply = pinger.Send(host);
            }
            catch (PingException)
            {
                // Discard PingExceptions and return false;
            }
            finally
            {
                pinger?.Dispose();
            }
            
            return reply;
        }
    }
}
