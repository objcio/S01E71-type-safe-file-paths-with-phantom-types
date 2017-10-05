enum File {}
enum Directory {}

struct Path<FileType> {
    var components: [String]
    
    private init(_ components: [String]) {
        self.components = components
    }
    
    var rendered: String {
        return "/" + components.joined(separator: "/")
    }
}

extension Path where FileType == Directory {
    init(directoryComponents: [String]) {
        self.components = directoryComponents
    }

    func appending(directory: String) -> Path<Directory> {
        return Path(directoryComponents: components + [directory])
    }
    
    func appendingFile(_ file: String) -> Path<File> {
        return Path<File>(components + [file])
    }
}

let path = Path(directoryComponents: ["Users", "chris"])

let path1 = path.appending(directory: "Documents")
let path2 = path1.appendingFile("test.md")
//let path3 = path2.appendingFile("test.md")

print(path2.rendered)
