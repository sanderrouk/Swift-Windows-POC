# SwiftWindowsPOC
SwiftWindowsPOC is a proof of concept project. The main intent of this project was to test the current state of Swift on windows and to try and play around with the Win32 GUI api. 
It is safe to say that the API is still in early days. That said I believe it shows promise for the future of swift development on Windows.

## Running
I used only SPM to build the project. For the first time it is necessary to copy a few files to the debug or release directories to get everything working.
```bash
$ swift build --product SwiftWindowsPOC
$ copy .\Sources\SwiftWindowsPOC\Info.plist .\.build\x86_64-unknown-windows-msvc\debug
$ copy .\Sources\SwiftWindowsPOC\SwiftWindowsPOC.exe.manifest .\.build\x86_64-unknown-windows-msvc\debug
$ swift run SwiftWindowsPOC
```

After the first time build it is possible to just use tools such as CLion to simply run the project. This might become easier in the future.

## Stuff to check out:

Swift getting started guide
https://swift.org/getting-started/#on-windows

CLion blog post (Make sure it is 2021.1 EAP or newer)
https://blog.jetbrains.com/objc/2021/03/swift-on-windows-in-clion/?fbclid=IwAR2VGomgDbG06AeardbRwqQWwXyDDl3Sz9o0oyAZmuxAid68rpPYH6NKMPs

Swift Win32
https://github.com/compnerd/swift-win32

## Shoutout
Shoutout to compnerd, the dude is insane.
https://github.com/compnerd