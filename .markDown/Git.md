# Cheat sheet on setting up Git

## Configuring SSH Keys
##### Creating an SSH key
```sh
Commands:
    mkdir ~/.ssh && cd ~/.ssh
    ssh-keygen  # At this stage, you can choose an arbitrary name for your SSH key
```

##### Adding an SSH key to a GitHub account
```sh
Command:
    cat ~/.ssh/"Key_Name"   # At this stage we need to read the private key (without extension.pub)

Action:
    Copy the output of the previous command to:
	GitHub.com > Settings > SSH and GPG keys > New SSH key
```


### Launching SSH-Agent and adding the key we just created to it
```sh
Commands:
	eval "$(ssh-agent)"         # Launching SSH-Agent
	ssh-add ~/.ssh/"Key_Name"   # At this stage, we need to transfer the private key to the agent ( without extension .pub)
	ssh-add -l                  # Checking the addition of the key
```

## Adding a Git Account
```sh
Commands:
	git config --global user.name "UserName"
	git config --global user.email "Email@example.com"
```


## Git Command Hints
### Cloning a repository
```sh
git clone git@github:"UserName"/"Repository_Name".git [1]	# Cloning via SSH
```
```sh
git clone https://... [1]					# Cloning via HTTPS
```
__[1]__ - If you want the repository to be cloned to the current folder,
then leave this cell empty or specify the path(or folder name) to which you want to clone the repository

### Other commands
##### File indexing
```sh
git add *.txt   # Index all text files
```
```sh
git add .       # Indexing all files
```

##### Remove file indexing
```sh
git restore --staged *.txt	# Remove indexing of all text files
```
```sh
git restore --staged .			# Remove indexing of all files
```

##### Creating a commit
```sh
git commit -m "Comment"
```

##### Sending a commit to the server
```sh
git push
```
