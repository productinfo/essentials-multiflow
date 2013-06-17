ShinobiEssentials MultiFlow Demo (Objective-C)
=====================

One of the more subtle features of the flow layout control is the ability to drag a subview outside the layout, and even to place it inside another flow layout. [ShinobiPlay](http://www.shinobicontrols.com/shinobiplay/) demonstrates this in the "Arrange" section of the Experience pages. Normally, flow layout would stop a view being dragged outside, but in "Arrange" we have 9 tasks which can be arranged across 3 flow layouts, representing "To Do" tasks, "In Progress" tasks and "Finished" tasks. This was created using a manager responsible for all flow layouts, and have it act as the delegate of each flow.

This project demonstrates how to create a MultiFlow layout for yourself. There's an accompanying blog post [here](http://www.shinobicontrols.com/blog/posts/2013/02/27/flow-by-flow/).

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiEssentials. If you don't have it yet, you can download a free trial from the [ShinobiEssentials website](http://www.shinobicontrols.com/shinobiessentials/).

Once you've downloaded and unzipped ShinobiEssentials, open up the project in XCode, and drag ShinobiEssentials.embeddedframework from the finder into Xcode's 'frameworks' group, and XCode will sort out all the header and linker paths for you.

If you’re using the trial version you’ll need to add your license key. To do so, open up AppDelegate.m, import <ShinobiEssentials/SEssentials.h>, and set the license key inside application:didFinishLaunchingWithOptions: as follows:

    #import <ShinobiEssentials/SEssentials.h>

    @implementation AppDelegate

    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
        [SEssentials setLicenseKey:@"your license key"];
        …
    }

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.

