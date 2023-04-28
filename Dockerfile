FROM ubuntu:22.10

# Update the Ubuntu
RUN apt-get update

# Python Interpreter and Package Manager
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

# NodeJS and YARN
RUN apt-get install -y nodejs
RUN apt-get install -y yarn

# C and C++ Compiler
RUN apt-get install build-essential

# SSH Server
RUN apt-get install -y openssh-server
RUN echo 'root:prolearn-is-the-best' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22