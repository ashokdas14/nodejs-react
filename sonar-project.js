const sonarqubeScanner = require('sonarqube-scanner');
    sonarqubeScanner({
      serverUrl: 'http://10.128.0.3:9000',
      options : {
       'sonar.sources': '.',
       'sonar.inclusions' : 'src/**' // Entry point of your code
       }
     }, () => {});

