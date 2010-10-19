package org.ronintech

/**
 * Created by IntelliJ IDEA.
 * User: jbrush
 * Date: Aug 6, 2010
 * Time: 5:05:52 PM
 * To change this template use File | Settings | File Templates.
 */
class StringUtil {

    static String properCase(String s) {
        s.split(' ').collect {
            def pc = ''
            if (it) {
                pc = it[0].toUpperCase()
                if (it.size() > 1) {
                    pc += it[1..-1].toLowerCase()
                }
            }

            return pc
        }.join(' ')
    }
}
