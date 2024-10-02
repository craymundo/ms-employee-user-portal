using Microsoft.AspNetCore.SignalR;

namespace ms_employee_user_portal.Hubs
{
    public class NotificationHub : Hub
    {
        public async Task NotifyCreate(string employeeName)
        {
            await Clients.All.SendAsync("ReceiveCreateNotification", employeeName);
        }


        public async Task NotifyUpdate(string employeeName)
        {
            await Clients.All.SendAsync("ReceiveUpdateNotification", employeeName);
        }

        public async Task NotifyDelete(string employeeName)
        {
            await Clients.All.SendAsync("ReceiveDeleteNotification", employeeName);
        }
    }
}
