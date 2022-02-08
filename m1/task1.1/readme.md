## Task 1.1

### Git

**What I have learned and practiced with Git**

I worked in Git Bash and practiced these things:

- Cloning repository from Github to my workstation

```git
git clone https://github.com/AlexeyGol/DevOps_online_Kharkiv_2022Q1Q2.git
```
- Adding files to staging area and commiting them

```git
git add .
git commit -m "Commit message"
```
- Branching 
  - Finished this interactive [tutorial](https://learngitbranching.js.org/)
  - Discovering the current branch I am located in

```git
git branch
git status
```
  - Creating branches

```git
git branch BranchName
git checkout -b BranchName
```
  - Switching branches
```git
git switch BranchName
git checkout BranchName
```
  - Merging branches with resolving appeared conflict

```git
git merge
```

- Inspected my repository with log and reflog commands

```git
git reflog show
git log --oneline
```

- Pushing changes to repository

```git
git push origin --all
```

- Created .gitignore file and added the unneded files to it
- Learned markdown language to create this readme file
  - [Markdown tutorial](https://www.markdowntutorial.com/)
  - Readed [GitHub Docs page](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

___

### What is DevOps?
##### Here are my 50 words about it

DevOps is a synergy of culture, philosophy, practices, and tools, which accelerate teams' productivity in fast delivering applications. The core of DevOps is CI/CD. DevOps evolved from Agile. However, while Agile addresses the gap between clients and developers, DevOps crashes the silo between development teams and operation folks.