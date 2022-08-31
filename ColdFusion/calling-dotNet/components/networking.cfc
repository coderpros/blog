component networking 
{
    public boolean function hostUp(required string host)
    {
        var connectivity = CreateObject("dotnet", "CoderPro.Blog.Networking.Old.Connectivity", "D:\Projects\Clients\CoderPro.Blog\CoderPro.Blog.Networking.Old\bin\Debug\CoderPro.Blog.Networking.Old.dll");

        return connectivity.HostUp(host);
    }
}