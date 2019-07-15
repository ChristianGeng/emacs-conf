# emacs-conf
=======

=======

My adapation of  
https://github.com/chaoflow/.emacs.d

Original README: 

Be prepared for rebases.

Better take a look at:

- https://github.com/corecode/skel/tree/master/.emacs.d
- https://github.com/magnars/.emacs.d/
- https://github.com/cjohansen/.emacs.d
- https://github.com/technomancy/emacs-starter-kit
from which I take inspiration or shamelessly copy.

# Further Links
* [Emacs Manual](https://www.gnu.org/software/emacs/manual/html_node/emacs/index.html#Top)
* [imenu and icycles](https://www.emacswiki.org/emacs/ImenuMode#toc3)
* [Emacs Mode Hook for autopep](http://avilpage.com/2015/05/automatically-pep8-your-python-code.html)

- http://www.coli.uni-saarland.de/~slemaguer/emacs/main.html#org67e2b1b
- https://github.com/Schnouki
- https://github.com/tmtxt/.emacs.d/tree/master/config
- https://www.masteringemacs.org
- https://caiorss.github.io/Emacs-Elisp-Programming/Keybindings.html
- http://ergoemacs.org/emacs/emacs_find_replace.html

## Lisp

1. [Learn Emacs Lips the Hard Way](https://github.com/hypernumbers/learn_elisp_the_hard_way/tree/master/contents)
2. [Emacs Lisp caiorss](https://caiorss.github.io/Emacs-Elisp-Programming/Elisp_Programming.html#sec-4-2)
3. [Elisp versus Scheme Lisp keywords](https://www.cs.utexas.edu/~novak/schemevscl.html)

## Helm
1. [A Package in a league of its own](https://tuhdo.github.io/helm-intro.html)
2. [helm-wiki](https://github.com/emacs-helm/helm/wiki)
3. [bloc post](http://thescratchcastle.com/posts/emacs-and-helm.html)
4. [helm-swoop](allows to edit occurrences in many files too)

## python
1. [lsp-mode](https://vxlabs.com/2018/06/08/python-language-server-with-emacs-and-lsp-mode/)
2. [red baron](https://www.reddit.com/r/emacs/comments/4oyvcn/redbaron_for_emacs_refactor_your_python_method/)
3. [python lsp server imple111mentation](https://github.com/palantir/python-language-server)


Elpy issues: https://github.com/jorgenschaefer/elpy/issues/842

###  Autopep
1. [Anleitung für pep mode hook](https://avilpage.com/2015/05/automatically-pep8-your-python-code.html)



# Code Navigation

## [etags primer](https://www.coverfire.com/archives/2004/06/24/emacs-source-code-navigation/)

* `find . -name '*.[ch]' | xargs etags`
* M-. (that’s Meta-Period) and type the name of the function
* M-* to navigate to last point

* Use helm to navigate to tags: M-x helm-etags-select

* Use projectile-regenerate-tags to generate tags before. 


# Fill column indication

* start using fci-mode
* (setq fci-rule-column 100)


## Java IDE

http://www.goldsborough.me/emacs,/java/2016/02/24/22-54-16-setting_up_emacs_for_java_development/
http://www.skybert.net/emacs/java/
https://github.com/skybert/my-little-friends/blob/master/emacs/.emacs.d/tkj-java-meghanada.el
https://github.com/skybert/my-little-friends/blob/master/emacs/.emacs.d/tkj-java-meghanada.el
