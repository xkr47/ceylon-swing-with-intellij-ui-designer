"Default documentation for module `test`."

native("jvm") module test "1.0.0" {
    import java.base "8";
    import java.desktop "8";
    import maven:"com.intellij:forms_rt" "7.0.3";
}
