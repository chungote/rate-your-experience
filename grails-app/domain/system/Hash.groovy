package system

class Hash {
    static MD5 = "MD5"
    static MD5_SALT = "MD5_SALT"

    static constraints = {
        code(maxSize: 128)
        value(maxSize: 1024)
    }
    static mapping = {
        code index: 'hash_code_idx'
    }

    static transients = ['salt']

    String code
    String value

    Boolean usedFlag = false

    String type
    String salt

    Date dateCreated
    Date lastUpdated

    String toString() {
        "${this.class.name} $id $code $value $type"
    }

    def Hash() {

    }

    def Hash(String _value, String _type = MD5_SALT) {
        value = _value
        this.type = _type
        calculate()
    }

    private def calculate() {

        switch (type) {
            case MD5:
                code = (value).encodeAsMD5()
                break;
            case MD5_SALT:
                salt = new Date().getTime().toString() + "~"
                code = (salt + value).encodeAsMD5()
                break;
            default:
                throw new IllegalArgumentException("invalid code type")
        }

        return this
    }

}
