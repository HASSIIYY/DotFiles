# Cheat sheet on setting up Git
---

## Configuring SSH Keys
### 1. Creating an SSH key
> After creating an SSH key, you need to add it to your GitHub account

```sh
cd ~/.ssh
ssh-keygen  # At this stage, you can choose an arbitrary name for your SSH key
```
### 2. Launching SSH-Agent and adding the key we just created to it
```sh
eval "$(ssh-agent)"         # Launching SSH-Agent
ssh-add ~/.ssh/"Key_Name"   # At this stage , we need to transfer the private key to the agent ( without extension .pub)
ssh-add -l                  # Checking the addition of the key
```

## Adding a Git Account
```sh
git config --global user.name "UserName"
git config --global user.email "Email@example.com"
```

## Git Command Hints
---
### Cloning a repository
```sh
git clone git@github:"UserName"/"Repository_Name".git [1]
 OR
git clone https://... [1]
```
__[1]__ - If you want the repository to be cloned to the current folder,
then leave this cell empty or specify the path(or folder name) to which you want to clone the repository

### Other commands
##### File indexing
```sh
git add *.txt   # Index all text files
git add .       # Indexing all files
```
##### Creating a commit
```sh
git commit -m "Comment"
```

##### Sending a commit to the server
```sh
git push
```
