FROM centos7.2.1511-base
MAINTAINER LiangWei <liang.wei@outlook.com> 
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key  
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key  
RUN sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd  
RUN mkdir -p /root/.ssh && chown root.root /root && chmod 700 /root/.ssh  
#EXPOSE 22  #如果需要暴露22端口出去，请将注释去掉
RUN echo 'root:jyALL@linux' | chpasswd  
ENV LANG en_US.UTF-8  
ENV LC_ALL en_US.UTF-8 
CMD /usr/sbin/sshd -D
