# startracker_daemon.py - daemonizer for the star tracker
# by Umair Khan and Ryan Medick, from the Portland State Aerospace Society

# Imports
import sys
import os
import time
import atexit
import signal
import daemon
import startracker

# Class definition
class StarTrackerDaemon:

    # Initialize PID file and directories
    def __init__(self, pidfile):
        self.pidfile = pidfile
        self.db_root = None
        self.data_root = None

    # Daemonize the class by forking
    def daemonize(self):

        # Make the first child (the parent exists)
        try:
            pid = os.fork()
            if pid > 0:
                sys.exit(0)
        except OSError as err:
            sys.stderr.write('fork #1 failed: {0}\n'.format(err))
            sys.exit(1)

        # Decouple from parent environment
        os.chdir('/')
        os.setsid()
        os.umask(0)

        # Make the second child (the parent exists)
        try:
            pid = os.fork()
            if pid > 0:
                sys.exit(0)
        except OSError as err:
            sys.stderr.write('fork #2 failed: {0}\n'.format(err))
            sys.exit(1)

        # Redirect file descriptors
        sys.stdout.flush()
        sys.stderr.flush()
        si = open(os.devnull, 'r')
        so = open(os.devnull, 'a+')
        se = open(os.devnull, 'a+')

        os.dup2(si.fileno(), sys.stdin.fileno())
        os.dup2(so.fileno(), sys.stdout.fileno())
        os.dup2(se.fileno(), sys.stderr.fileno())

        # Write PID file
        atexit.register(self.delpid)
        pid = str(os.getpid())
        with open(self.pidfile,'w+') as f:
            f.write(pid + '\n')

    # Delete PID file
    def delpid(self):
        os.remove(self.pidfile)

    # Start the daemon
    def start(self, db_root, data_root):

        # Set the working directory
        self.db_root = db_root
        self.data_root = data_root

        # Check for a pidfile to see if the daemon is already running
        try:
            with open(self.pidfile,'r') as pf:
                pid = int(pf.read().strip())
        except IOError:
            pid = None

        if pid:
            message = "pidfile {0} already exists. Daemon already running?\n".format(self.pidfile)
            sys.stderr.write(message)
            sys.exit(1)

        # Start the daemon
        self.daemonize()
        self.run()

    # Stop the daemon
    def stop(self):

        # Get the pid from the pidfile
        try:
            with open(self.pidfile,'r') as pf:
                pid = int(pf.read().strip())
        except IOError:
            pid = None

        if not pid:
            message = "pidfile {0} does not exist. Daemon not running?\n".format(self.pidfile)
            sys.stderr.write(message)
            return

        # Try killing the daemon process
        try:
            while 1:
                os.kill(pid, signal.SIGTERM)
                time.sleep(0.1)
        except OSError as err:
            e = str(err.args)
            if e.find("No such process") > 0:
                if os.path.exists(self.pidfile):
                    os.remove(self.pidfile)
            else:
                print(str(err.args))
                sys.exit(1)

    # Restart the daemon
    def restart(self, db_root, data_root):
        self.stop()
        self.start(db_root, data_root)

    # Run the star tracker
    def run(self):
        sts = startracker.StarTrackerServer()
        sts.start(self.data_root + "median_image.png", self.data_root + "calibration.txt", self.db_root + "hip_main.dat", sample_dir = self.data_root + "samples/")

# Run script
if __name__ == "__main__":
    assert len(sys.argv) > 1, "usage:\t{0} start\n\t\t\t{0} stop\n\t\t\t{0} restart".format(sys.argv[0])
    daemon = StarTrackerDaemon('/run/oresat-star-tracker.pid')
    db_root = "/home/ukhan/github/oresat-star-tracker/openstartracker/"
    data_root = "/home/ukhan/github/oresat-star-tracker/openstartracker/datasets/downsample/"
    if 'start' == sys.argv[1]:
        daemon.start(db_root, data_root)
    elif 'stop' == sys.argv[1]:
        daemon.stop()
    elif 'restart' == sys.argv[1]:
        daemon.restart(db_root, data_root)
    else:
        print("Unknown command")
        sys.exit(2)
    sys.exit(0)