.class public final LSLModBackup;
.super Ljava/lang/Object;
.source "SLModBackup.java"


# static fields
.field private static final FILE:Ljava/lang/String; = "sl_mod_backup_v1.bin"

.field private static final LIMIT:I = 0x2000000

.field private static final MAGIC:I = 0x534c4d31

.field private static final MAX_ITEMS:I = 0x4e20

.field private static final NAMES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 14
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "sl_mod_settings"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "sl_agenda_prefs_v1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "sl_agenda_panel_v1"

    aput-object v2, v0, v1

    sput-object v0, LSLModBackup;->NAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static readString(Ljava/io/DataInputStream;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p0}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    if-ltz v0, :cond_a

    const/high16 v1, 0x2000000

    if-le v0, v1, :cond_12

    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid string size"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_12
    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/io/DataInputStream;->readFully([B)V

    .line 122
    :try_start_17
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;
    :try_end_34
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_17 .. :try_end_34} :catch_36

    move-result-object v0

    return-object v0

    .line 123
    :catch_36
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid UTF-8"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static replace(Landroid/content/SharedPreferences;Ljava/util/Map;)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 98
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 99
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 100
    instance-of v4, v0, Ljava/lang/String;

    if-eqz v4, :cond_30

    check-cast v0, Ljava/lang/String;

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_10

    .line 101
    :cond_30
    instance-of v4, v0, Ljava/lang/Boolean;

    if-eqz v4, :cond_3e

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_10

    .line 102
    :cond_3e
    instance-of v4, v0, Ljava/lang/Integer;

    if-eqz v4, :cond_4c

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_10

    .line 103
    :cond_4c
    instance-of v4, v0, Ljava/lang/Long;

    if-eqz v4, :cond_5a

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v2, v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_10

    .line 104
    :cond_5a
    instance-of v4, v0, Ljava/lang/Float;

    if-eqz v4, :cond_68

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-interface {v2, v1, v0}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_10

    .line 105
    :cond_68
    instance-of v4, v0, Ljava/util/Set;

    if-eqz v4, :cond_98

    .line 106
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 107
    check-cast v0, Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_77
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_93

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v6, v0, Ljava/lang/String;

    if-nez v6, :cond_8d

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid set"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8d
    check-cast v0, Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_77

    .line 108
    :cond_93
    invoke-interface {v2, v1, v4}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_10

    .line 109
    :cond_98
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported preference"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_a0
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    return v0
.end method

.method public static restore(Landroid/content/Context;Ljava/io/File;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v0, Ljava/io/File;

    const-string v1, "sl_mod_backup_v1.bin"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 53
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_e

    .line 95
    :cond_d
    return-void

    .line 54
    :cond_e
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/32 v4, 0x2000000

    cmp-long v1, v2, v4

    if-lez v1, :cond_27

    :cond_1f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid mod backup size"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_27
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 56
    new-instance v5, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 57
    :try_start_3b
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    const v1, 0x534c4d31

    if-ne v0, v1, :cond_4d

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    sget-object v1, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v1, v1

    if-eq v0, v1, :cond_5a

    :cond_4d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid mod backup header"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_55} :catch_55

    .line 56
    :catch_55
    move-exception v0

    :try_start_56
    invoke-virtual {v5}, Ljava/io/DataInputStream;->close()V
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_59} :catch_169

    :goto_59
    throw v0

    .line 58
    :cond_5a
    :try_start_5a
    sget-object v6, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v7, v6

    const/4 v0, 0x0

    move v3, v0

    :goto_5f
    if-ge v3, v7, :cond_136

    aget-object v0, v6, v3

    .line 59
    invoke-static {v5}, LSLModBackup;->readString(Ljava/io/DataInputStream;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_75

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid mod backup section"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_75
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v8

    .line 61
    if-ltz v8, :cond_7f

    const/16 v0, 0x4e20

    if-le v8, v0, :cond_87

    :cond_7f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid preference count"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_87
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    .line 63
    const/4 v0, 0x0

    move v2, v0

    :goto_8e
    if-ge v2, v8, :cond_12e

    .line 64
    invoke-static {v5}, LSLModBackup;->readString(Ljava/io/DataInputStream;)Ljava/lang/String;

    move-result-object v10

    .line 65
    invoke-interface {v9, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a2

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Duplicate preference"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_a2
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    .line 67
    packed-switch v0, :pswitch_data_1c0

    .line 79
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unknown preference type"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :pswitch_b1
    invoke-static {v5}, LSLModBackup;->readString(Ljava/io/DataInputStream;)Ljava/lang/String;

    move-result-object v0

    .line 81
    :cond_b5
    :goto_b5
    invoke-interface {v9, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_8e

    .line 69
    :pswitch_bc
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_cb

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid boolean"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_cb
    const/4 v1, 0x1

    if-ne v0, v1, :cond_d4

    const/4 v0, 0x1

    :goto_cf
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_b5

    :cond_d4
    const/4 v0, 0x0

    goto :goto_cf

    .line 70
    :pswitch_d6
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_b5

    .line 71
    :pswitch_df
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    goto :goto_b5

    .line 72
    :pswitch_e8
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readFloat()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isFinite(F)Z

    move-result v1

    if-nez v1, :cond_fa

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid float"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_fa
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    goto :goto_b5

    .line 74
    :pswitch_ff
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v11

    if-ltz v11, :cond_109

    const/16 v0, 0x4e20

    if-le v11, v0, :cond_111

    :cond_109
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid set size"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_111
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 76
    const/4 v1, 0x0

    :goto_117
    if-ge v1, v11, :cond_b5

    invoke-static {v5}, LSLModBackup;->readString(Ljava/io/DataInputStream;)Ljava/lang/String;

    move-result-object v12

    invoke-interface {v0, v12}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_12b

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Duplicate set item"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12b
    add-int/lit8 v1, v1, 0x1

    goto :goto_117

    .line 83
    :cond_12e
    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto/16 :goto_5f

    .line 85
    :cond_136
    invoke-virtual {v5}, Ljava/io/DataInputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_145

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unexpected mod backup content"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_145
    .catch Ljava/lang/Throwable; {:try_start_5a .. :try_end_145} :catch_55

    .line 86
    :cond_145
    invoke-virtual {v5}, Ljava/io/DataInputStream;->close()V

    .line 87
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 88
    sget-object v1, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v2, v1

    const/4 v0, 0x0

    :goto_151
    if-ge v0, v2, :cond_16f

    aget-object v5, v1, v0

    new-instance v6, Ljava/util/HashMap;

    const/4 v7, 0x0

    invoke-virtual {p0, v5, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_151

    .line 56
    :catch_169
    move-exception v1

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_59

    .line 90
    :cond_16f
    const/4 v0, 0x0

    move v1, v0

    :goto_171
    :try_start_171
    sget-object v0, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-ge v1, v0, :cond_d

    sget-object v0, LSLModBackup;->NAMES:[Ljava/lang/String;

    aget-object v0, v0, v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {v2, v0}, LSLModBackup;->replace(Landroid/content/SharedPreferences;Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_1b2

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Could not restore mod settings"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_193
    .catch Ljava/lang/Exception; {:try_start_171 .. :try_end_193} :catch_193

    .line 91
    :catch_193
    move-exception v0

    move-object v2, v0

    .line 92
    const/4 v0, 0x0

    move v1, v0

    :goto_197
    sget-object v0, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v0, v0

    if-ge v1, v0, :cond_1b6

    :try_start_19c
    sget-object v0, LSLModBackup;->NAMES:[Ljava/lang/String;

    aget-object v0, v0, v1

    const/4 v4, 0x0

    invoke-virtual {p0, v0, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {v4, v0}, LSLModBackup;->replace(Landroid/content/SharedPreferences;Ljava/util/Map;)Z
    :try_end_1ae
    .catch Ljava/lang/Exception; {:try_start_19c .. :try_end_1ae} :catch_1be

    :goto_1ae
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_197

    .line 90
    :cond_1b2
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_171

    .line 93
    :cond_1b6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mod restore failed; rollback attempted"

    invoke-direct {v0, v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 92
    :catch_1be
    move-exception v0

    goto :goto_1ae

    .line 67
    :pswitch_data_1c0
    .packed-switch 0x1
        :pswitch_b1
        :pswitch_bc
        :pswitch_d6
        :pswitch_df
        :pswitch_e8
        :pswitch_ff
    .end packed-switch
.end method

.method public static write(Landroid/content/Context;Ljava/util/zip/ZipOutputStream;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v11, 0x2000000

    const/16 v10, 0x4e20

    const/4 v3, 0x0

    .line 19
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 20
    new-instance v5, Ljava/io/DataOutputStream;

    invoke-direct {v5, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 21
    const v0, 0x534c4d31

    invoke-virtual {v5, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 22
    sget-object v0, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v0, v0

    invoke-virtual {v5, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 23
    sget-object v6, LSLModBackup;->NAMES:[Ljava/lang/String;

    array-length v7, v6

    move v2, v3

    :goto_1f
    if-ge v2, v7, :cond_120

    aget-object v0, v6, v2

    .line 24
    invoke-static {v5, v0}, LSLModBackup;->writeString(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 25
    invoke-virtual {p0, v0, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 26
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-le v1, v10, :cond_3c

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Too many mod settings"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_3c
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 28
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_11b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 29
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v5, v1}, LSLModBackup;->writeString(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 30
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 31
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_7f

    const/4 v1, 0x1

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    check-cast v0, Ljava/lang/String;

    invoke-static {v5, v0}, LSLModBackup;->writeString(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 42
    :cond_71
    :goto_71
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-le v0, v11, :cond_4b

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mod backup too large"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_7f
    instance-of v1, v0, Ljava/lang/Boolean;

    if-eqz v1, :cond_91

    const/4 v1, 0x2

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {v5, v0}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    goto :goto_71

    .line 33
    :cond_91
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_a3

    const/4 v1, 0x3

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    goto :goto_71

    .line 34
    :cond_a3
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_b5

    const/4 v1, 0x4

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {v5, v0, v1}, Ljava/io/DataOutputStream;->writeLong(J)V

    goto :goto_71

    .line 35
    :cond_b5
    instance-of v1, v0, Ljava/lang/Float;

    if-eqz v1, :cond_d4

    move-object v1, v0

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->isFinite(F)Z

    move-result v1

    if-eqz v1, :cond_d4

    const/4 v1, 0x5

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v5, v0}, Ljava/io/DataOutputStream;->writeFloat(F)V

    goto :goto_71

    .line 36
    :cond_d4
    instance-of v1, v0, Ljava/util/Set;

    if-eqz v1, :cond_113

    .line 37
    check-cast v0, Ljava/util/Set;

    .line 38
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    if-le v1, v10, :cond_e8

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Too many set entries"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_e8
    const/4 v1, 0x6

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    invoke-virtual {v5, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 40
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_71

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    instance-of v9, v0, Ljava/lang/String;

    if-nez v9, :cond_10d

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Invalid set value"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10d
    check-cast v0, Ljava/lang/String;

    invoke-static {v5, v0}, LSLModBackup;->writeString(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    goto :goto_f7

    .line 41
    :cond_113
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Unsupported mod preference value"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 23
    :cond_11b
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_1f

    .line 45
    :cond_120
    invoke-virtual {v5}, Ljava/io/DataOutputStream;->flush()V

    .line 46
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-le v0, v11, :cond_131

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mod backup too large"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_131
    new-instance v0, Ljava/util/zip/ZipEntry;

    const-string v1, "sl_mod_backup_v1.bin"

    invoke-direct {v0, v1}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 48
    invoke-virtual {v4, p1}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 49
    invoke-virtual {p1}, Ljava/util/zip/ZipOutputStream;->closeEntry()V

    .line 50
    return-void
.end method

.method private static writeString(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    if-nez p1, :cond_a

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Null string"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_a
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 116
    array-length v1, v0

    const/high16 v2, 0x2000000

    if-le v1, v2, :cond_1d

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Mod value too large"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 117
    :cond_1d
    array-length v1, v0

    invoke-virtual {p0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {p0, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 118
    return-void
.end method
