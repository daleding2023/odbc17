FROM registry.cn-hangzhou.aliyuncs.com/models2024/centos7:openjdk180
USER root
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/mssql-release.repo
RUN yum remove unixODBC-utf16 unixODBC-utf16-devel
RUN ACCEPT_EULA=Y yum install -y msodbcsql17
RUN ACCEPT_EULA=Y yum install -y mssql-tools
RUN echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
RUN source ~/.bashrc
RUN yum install -y unixODBC-devel && yum clean all
