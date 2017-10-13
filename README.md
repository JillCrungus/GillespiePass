Mod for Half-Life 2: Episode Two.



HOW TO CLONE THIS REPO AS A DEV (The super cool step by step guide to working on Gillespie Pass):

1. Tell me (Jill) the name of your GitHub account so I can add you to the repo

2. Download GitHub Desktop: https://desktop.github.com

3. Choose to clone a repository

4. You should be able to clone this one

5. Clone it to sourcemods/GillespiePass (IT MUST BE THIS EXACT FOLDER NAME OR SEVERAL THINGS WILL BREAK)

6. It should download and stuff. 

7. Making sure the "master" branch is selected, you should be able to "fetch origin" to update your stuff.

8. If there are new commits, you should be able to download those and keep your version up to date with "Pull origin"



HOW TO PUSH CHANGES:

1. The first step is ALWAYS to make sure you sync your local copy with any latest commits. (Fetch origin, pull origin) Make sure none of your changes conflict with something someone else has done.

2. In the main window of the GitHub desktop app you can select the files you wish to commit (usually all of them) and then write a commit summary and description.

3. Commit to the master branch

4. Open up the History tab, make sure everything in your commit is in order and push the changes!


HOW TO BUILD:

1. Open games.sln

2. For BOTH client (episodic) AND server (episodic) )

Right click

Properties

Set output directory to your Gillespie Pass "bin" directory

Click to C/C++ category

Disable warnings and disable treat warnings as errors

3. Once you've done this for both of the projects you can right click > build them.