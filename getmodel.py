import os, sys
from huggingface_hub import hf_hub_download
if len(sys.argv)!=3:
	print(f"Usage: {sys.argv[0]} [ MODEL-REPOSITORY MODEL-FILE ]")
	sys.exit()
hf_hub_download(repo_id=sys.argv[1], filename=sys.argv[2], local_dir="./models")
