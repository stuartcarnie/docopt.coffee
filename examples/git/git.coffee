doc = """usage: git [--version] [--exec-path=<path>] [--html-path]
           [-p|--paginate|--no-pager] [--no-replace-objects]
           [--bare] [--git-dir=<path>] [--work-tree=<path>]
           [-c <name>=<value>] [--help]
           <command> [<args>...]

options:
   -c <name=value>
   -h, --help
   -p, --paginate

The most commonly used git commands are:
   remote     Manage set of tracked repositories

See 'git help <command>' for more information on a specific command.

"""
{docopt} = require '../../docopt'
child_process = require 'child_process'

args = docopt(doc, version: 'git version 1.7.4.4', options_first: true)

console.log('global arguments:')
console.log(args)
console.log('command arguments:')

argv = [args['<command>']] + args['<args>']

if args['<command>'] in ['remote']
	cmd = 'coffee git_' + args['<command>'] + '.coffee ' + args['<command>'] + ' ' + args['<args>']
	child_process.exec cmd, (error, stdout, stderr) ->
		console.log stdout
else
	console.error args['<command>'] + " is not a git.coffee command. See 'git help'."
