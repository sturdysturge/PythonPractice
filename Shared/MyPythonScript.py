import gym
def make(name):
    env = gym.make(name)
    env.reset()
    for _ in range(1000):
        env.render()
        env.step(env.action_space.sample()) # take a random action
    env.close()
