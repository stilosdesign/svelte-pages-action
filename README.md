# SveltePagesAction

This Action will build your svelte or any project front-end and deploy it to Github Pages

# Parameters

This project uses docker containers to build and publish your project on Github Pages this way some inputs are required for the flow to be performed.

|  Parameter |  Description | Required
| :------------ | :------------ |:------------ |
| `token` | Personal access token secrets | **Yes** |
| `username` | Personal access token secrets | **Yes** |
| `reposname` | The repository you want to deploy. e.g.:testpage/blog. Default: current repository |	**No** |
| `repospage` |	The branch you want to deploy. e.g.:gh-pages.Default: gh-pages | **No** |
| `script` | The script to build the svelte or other project. e.g.: `npm install && npm run build` | **Yes** |
| `buildfolder` | The output of the build-script above. e.g.:  `dist/ ` | **Yes** |
| `commitmessage` | The commit message supplied when pushing new changes e.g.:  `Auto deploy from Github Actions ` | **No** |
| `cname` | Alias Record of your site. | **No** |

# Usage

Create `svelte-deploy.yml` in the `.github/workflows` directory in the root of your repository.


```yml
name: Build And Deploy Svelte
on: [push]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2 # or v3

      - name: svelte-deploy
        id: svelte-deploy
        uses: stilosdesign/SveltePagesAction@v1.0.0
        with:
          username: 'username'
          reposname: 'reposname'
          repospage: 'gh-pages'
          token: ${{ secrets.ACCESS_TOKEN }}
          scripts: 'npm install && npm run build'
          buildfolder: 'dist'
```

The action will auto deploy the svelte or other project when you push your code. Enjoy!!!

# Details

Check if the repository you want to run the action/workflows has the proper permissions for external streams

Navigate to:

- https://github.com/username/reposname/settings/actions

Options:
  - Actions permissions
    - Allow all actions and reusable workflows

  **this option must be checked** 

  - Workflow permissions
    - Read an write permissions

  **this option must be checked**

With these options active, actions/workflows can be executed without further problems in your repository.

## Steps by steps guide

`1` - Create a personal access token

Click your profile icon > Settings > Developer settings > Personal access tokens > Generate new token > At least check repo. 

Then you will get a token, copy it.

`2` - Creating encrypted secrets

Under your repository name, click Settings > Secrets > Type ASSESS_TOKEN in the "Name" input box && the the personal access token as value.

`3` - Create a workflow file

If you repo doesn't already have one, create a workflow file. You must store workflows in the .github/workflows directory in the root of your repository.

In .github/workflows, add a .yml or .yaml file for your workflow. For example, .github/workflows/svelte-deploy.yml.

The content of the yml file must follow what is in the example in usage, after that, with each new push, the github workflows will execute this action of yours.