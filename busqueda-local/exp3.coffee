{ execSync: e } = require 'child_process'
assert = require 'assert'

steps = 300000
stiter = 1000

#K = [1, 5, 15, 25, 50, 100, 150, 300]
#LAMBDA = [1, 0.1, 0.001, 0.00005, 0.00001, 0.000001]

K = [60, 70, 80, 90, 100, 110, 120]
LAMBDA = [0.0001, 0.0005, 0.001, 0.0015, 0.005, 0.01]

ITS = 5

heuristic = "criteria 1"
successor = "move"
generator = "mintt"
algorithm = "hill_climbing"

n_users = 200
n_servers = 50
max_requests = 5
repl_per_file = 5

SEMILLAS = ((new Date().getTime()) for i in [1..ITS])

print = (s) -> process.stdout.write s
#print "k lambda heuristic steps\n"

# Segundo

k = 100
lambda = 0.001

print "servers time\n"

SERVERS = [50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550]

for n_servers in SERVERS
    acc = { heuristic: 0, steps: 0, time: 0 }
    for i in [1..ITS]
        st = new Date().getTime()
        result = e "./dfs --non-interactive steps=#{steps} stiter=#{stiter} k=#{k} lambda=#{lambda} n_users=#{n_users} n_servers=#{n_servers} max_requests=#{max_requests} repl_per_file=#{repl_per_file} seed_servers=#{SEMILLAS[i-1]} seed_rq=#{SEMILLAS[i-1]} heuristic=\"#{heuristic}\" successor=#{successor} generator=#{generator} algorithm=#{algorithm}"
        end = new Date().getTime()

        result = JSON.parse result

        assert result.heuristic?
        assert result.steps?

        acc.heuristic += result.heuristic
        acc.steps += result.steps
        acc.time += (end - st)

    acc.heuristic //= ITS
    acc.steps //= ITS
    acc.time //= ITS

    print "#{n_servers} #{acc.time}\n"
