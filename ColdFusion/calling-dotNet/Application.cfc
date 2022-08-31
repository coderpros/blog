component Application {
    this.name = "calling-dotNet";
    this.currentPath = getDirectoryFromPath(getCurrentTemplatePath());
    this.delim = find("/", this.currentPath) ? "/" : "\";
    this.basePath = listDeleteAt(this.currentPath, listLen(this.currentPath, this.delim), this.delim);
    
    this.mappings["/components"] = this.basePath & this.delim & "components";
}