# Hugo static site generator Docker image (extended version)

Includes git, npm and postcss-cli with autoprefixer. Mount `/src` to your hugo site directory.

How to run:

```
$ cd your_hugo_site_dir
$ docker run -it --rm -v $PWD:/src biodranik/hugo-extended-git-postcss-cli hugo
```
