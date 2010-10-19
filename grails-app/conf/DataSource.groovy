dataSource {
  pooled = true
}
hibernate {
  cache.use_second_level_cache = true
  cache.use_query_cache = true
  cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
  development {
    dataSource {
      driverClassName = "org.hsqldb.jdbcDriver"
      dbCreate = "create-drop" // one of 'create', 'create-drop','update'
      url = "jdbc:hsqldb:mem:devDB"
    }
  }
  test {
    dataSource {
      driverClassName = "org.gjt.mm.mysql.Driver"
      username = "rye"
      password = "paar007"
      dbCreate = "update"
      url = "jdbc:mysql://Rye:3306/ryeTest?autoReconnect=true"

      properties {
        maxActive = 50
        maxIdle = 25
        minIdle = 5
        initialSize = 5
        //minEvictableIdleTimeMillis = 60000
        //timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000

        removeAbandonedTimeout = "60"

        testWhileIdle = true
        timeBetweenEvictionRunsMillis = 300000
      }
    }
 }
  production {
    dataSource {
      driverClassName = "org.gjt.mm.mysql.Driver"
      username = "rye"
      password = "paar007"
      dbCreate = "update"
      url = "jdbc:mysql://Rye:3306/ryeProd?autoReconnect=true"

      properties {
        maxActive = 50
        maxIdle = 25
        minIdle = 5
        initialSize = 5
        //minEvictableIdleTimeMillis = 60000
        //timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000

        removeAbandonedTimeout = "60"

        testWhileIdle = true
        timeBetweenEvictionRunsMillis = 300000
      }
    }


  }
}