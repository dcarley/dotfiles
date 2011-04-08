import os   
import IPython.ipapi
ip = IPython.ipapi.get()

def main():   
    o = ip.options
    o.system_verbose = 0
    
    # Disable prompt and paging for tab completion.
    import readline
    readline.parse_and_bind('set completion-query-items 1000')
    readline.parse_and_bind('set page-completions no')

    # Respect virtualenvs.
    execf('~/.ipython/virtualenv.py')

# some config helper functions you can use 
def import_all(modules):
    """ Usage: import_all("os sys") """ 
    for m in modules.split():
        ip.ex("from %s import *" % m)

def execf(fname):
    """ Execute a file in user namespace """
    ip.ex('execfile("%s")' % os.path.expanduser(fname))

main()
