import threading
import time
import random

class BackgroundWorker:
    def __init__(self):
        self.workers = []
        self.jobs = []

    def add_job(self, job):
        self.jobs.append(job)

    def start_workers(self, num_workers):
        for _ in range(num_workers):
            worker = threading.Thread(target=self.worker)
            worker.start()
            self.workers.append(worker)

    def worker(self):
        while True:
            if not self.jobs:
                time.sleep(0.1)
                continue
            job = self.jobs.pop(0)
            job()

def job1():
    print("Job 1 is running")
    time.sleep(2)
    print("Job 1 is done")

def job2():
    print("Job 2 is running")
    time.sleep(3)
    print("Job 2 is done")

def job3():
    print("Job 3 is running")
    time.sleep(1)
    print("Job 3 is done")

worker = BackgroundWorker()
worker.add_job(job1)
worker.add_job(job2)
worker.add_job(job3)

worker.start_workers(3)

while True:
    time.sleep(1)
    if not worker.jobs:
        break

for worker in worker.workers:
    worker.join()

print("All jobs are done") 

class MyThread(threading.Thread):
    def __init__(self, name):
        super().__init__()
        self.name = name

    def run(self):
        print(f"Thread {self.name} is running")
        time.sleep(random.randint(1, 5))
        print(f"Thread {self.name} is done")

thread1 = MyThread("Thread 1")
thread2 = MyThread("Thread 2")
thread3 = MyThread("Thread 3")

thread1.start()
thread2.start()
thread3.start()

thread1.join()
thread2.join()
thread3.join()

print("All threads are done")

class Worker:
    def __init__(self, name):
        self.name = name

    def work(self):
        print(f"{self.name} is working")
        time.sleep(2)
        print(f"{self.name} is done")

worker1 = Worker("Worker 1")
worker2 = Worker("Worker 2")
worker3 = Worker("Worker 3")

worker1.work()
worker2.work()
worker3.work()