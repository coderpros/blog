component networking 
{
    public boolean function hostUp(required string host)
    {
        var connectivity = createObject("dotnet", "CoderPro.Blog.Networking.Connectivity", "D:\Projects\Clients\CoderPro.Blog\CoderPro.Blog.Networking\bin\Debug\CoderPro.Blog.Networking.dll");
        
        return connectivity.HostUp(host);
    }
}