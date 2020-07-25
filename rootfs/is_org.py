import sys
import os
from github import Github

user_or_org = sys.argv[1]

g = Github(os.getenv("GITHUB_TOKEN"))
n_repos = g.get_user(user_or_org).get_repos().totalCount

# If n_repos == 0 then it's an org
print(n_repos == 0)
