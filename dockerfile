FROM java:8

ENV http_proxy ""
ENV https_proxy ""

RUN mkdir /test \
    && chmod -R 777 /test

ENV JMETER_VERSION=5.4.1
ENV JMETER_HOME=/usr/local/apache-jmeter-${JMETER_VERSION}
ENV JMETER_PATH=${JMETER_HOME}/bin:${PATH}
ENV PATH=${JMETER_HOME}/bin:${PATH}
# 设置JMeter环境变量

RUN wget https://mirrors.bfsu.edu.cn/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
    && tar -zxvf apache-jmeter-${JMETER_VERSION}.tgz -C /usr/local \
    && rm -rf apache-jmeter-${JMETER_VERSION}.tgz \
# 添加JMeter
    && sed -i '$a sampleresult.default.encoding=UTF-8' /usr/local/apache-jmeter-${JMETER_VERSION}/bin/jmeter.properties \
    && sed -i '159s/256/512/g' /usr/local/apache-jmeter-${JMETER_VERSION}/bin/jmeter \
# 修改JMeter配置文件
    && ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
