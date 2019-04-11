#!/usr/bin/env bash

function _svnToGit() {
  if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ];  then
    echo "Migrate SVN to GIT "
    echo "Usage: svn-to-git <local path> <authors file> <svn from url> <svn trunk path> <svn branch path>"
    echo ""
    echo " Options:"
    echo "          <local path>: directory to write new git repo   Ex: /home/git/repo1"
    echo "        <authors file>: file with authors                 Ex: /home/git/authors.txt"
    echo "        <svn from url>: svn address                       Ex: http://localhost:8085/svn/team/project1"
    echo "      <svn trunk path>: trunk path of svn                 Ex: trunk"
    echo "     <svn branch path>: branches path of svn              Ex: branches"
    echo ""
    return false
  fi
  local git_local_path=${1}
  local authors_file=${2}
  local svn_from_url=${3}
  local svn_trunk_path=${4}
  local svn_branch_path=${5}

  echo
  echo "------------------------------------------------------------------------------"
  echo "Cloning '${svn_from_url}'";
  echo "destination   : ${git_local_path}"
  echo "------------------------------------------------------------------------------"    
  echo

  if [ -d ${git_local_path} ]; then
    echo "rebasing..."    
    cd ${git_local_path}
    echo "git status and refresh..."
    git status
    git config gc.auto 0
    # git pull --all
    git svn fetch   
    git svn rebase
    git gc --auto
    # git push -u origin master
    
  else
    echo "cloning..."
      local params=""
      if [ -n "$svn_trunk_path" ];  then
        local params=" -T ${svn_trunk_path}"
      fi
      if [ -n "$branches_path" ];  then
        local params="${params} -b ${branches_path}"
      fi

    git svn clone ${svn_from_url} ${git_local_path} --authors-file=${authors_file} ${params} --no-minimize-url
    # cd ${git_local_path}
    # git remote add origin "${__git_repos_from}/${name}"
    # git push -u origin master
  fi
}
_svnToGit $@
