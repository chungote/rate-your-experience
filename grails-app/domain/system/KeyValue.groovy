package system

class KeyValue {

    static constraints = {
        key(maxSize: 255)
        value(maxSize: 255, nullable: true)
    }
    static mapping = {
        columns {
            key column: 'my_key', index: 'key_idx'
        }
    }
    String key
    String value


    String toString() {
        "${key}:$value"
    }

}
