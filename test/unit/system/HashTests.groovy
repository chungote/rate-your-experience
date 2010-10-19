package system

import grails.test.GrailsUnitTestCase

class HashTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
        loadCodec(org.codehaus.groovy.grails.plugins.codecs.MD5Codec)
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testHashMD5() {
        final def s = "The quick brown fox jumps over the lazy dog"
        final def hval = "9e107d9d372bb6826bd81d3542a419d6"

        def h = new Hash()
        h.value = s
        h.calculate(Hash.MD5)

        println h.dump()
        assertEquals hval, h.code


        def h2 = new Hash(s, Hash.MD5)

        assertEquals hval, h2.code
    }

    void testHashMD5_SALT() {
        final def s = "The quick brown fox jumps over the lazy dog"

        def h = new Hash()
        h.value = s
        h.calculate(Hash.MD5_SALT)

        println h.dump()
        assertEquals((h.salt + h.value).encodeAsMD5(), h.code)


        def h2 = new Hash(s)

        assertEquals((h2.salt + h2.value).encodeAsMD5(), h2.code)
    }
}
