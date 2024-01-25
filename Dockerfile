FROM registry.cn-hangzhou.aliyuncs.com/models2024/centos7:openjdk180
USER root
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/mssql-release.repo
RUN sudo yum remove unixODBC-utf16 unixODBC-utf16-devel
RUN sudo ACCEPT_EULA=Y yum install -y msodbcsql17
RUN sudo ACCEPT_EULA=Y yum install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc
RUN sudo yum install -y unixODBC-devel && yum clean all
