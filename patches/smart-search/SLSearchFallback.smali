.class public final LSLSearchFallback;
.super Ljava/lang/Object;
.source "SLSearchFallback.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static lettersOnly(Ljava/lang/String;)Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 59
    move v0, v1

    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_16

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLetter(C)Z

    move-result v2

    if-nez v2, :cond_13

    .line 60
    :goto_12
    return v1

    .line 59
    :cond_13
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 60
    :cond_16
    const/4 v1, 0x1

    goto :goto_12
.end method

.method private static oneEdit(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8

    .prologue
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 66
    sub-int v1, v2, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/4 v4, 0x1

    if-le v1, v4, :cond_13

    .line 74
    :cond_12
    :goto_12
    return v0

    :cond_13
    move v1, v0

    .line 68
    :goto_14
    if-ge v1, v2, :cond_25

    if-ge v1, v3, :cond_25

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_25

    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 69
    :cond_25
    if-ne v1, v2, :cond_29

    if-eq v1, v3, :cond_12

    .line 70
    :cond_29
    if-ne v2, v3, :cond_54

    add-int/lit8 v0, v1, 0x1

    if-ge v0, v2, :cond_54

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v0, v4, :cond_54

    add-int/lit8 v0, v1, 0x1

    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v0, v4, :cond_54

    add-int/lit8 v0, v1, 0x2

    add-int/lit8 v3, v1, 0x2

    sub-int v1, v2, v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p0, v0, p1, v3, v1}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    goto :goto_12

    .line 72
    :cond_54
    if-ne v2, v3, :cond_63

    add-int/lit8 v0, v1, 0x1

    add-int/lit8 v3, v1, 0x1

    sub-int v1, v2, v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, p1, v3, v1}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    goto :goto_12

    .line 73
    :cond_63
    if-le v2, v3, :cond_6e

    add-int/lit8 v0, v1, 0x1

    sub-int v2, v3, v1

    invoke-virtual {p0, v0, p1, v1, v2}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    goto :goto_12

    .line 74
    :cond_6e
    add-int/lit8 v0, v1, 0x1

    sub-int/2addr v2, v1

    invoke-virtual {p0, v1, p1, v0, v2}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    goto :goto_12
.end method

.method public static score(Ljava/lang/String;Ljava/lang/String;)I
    .registers 14

    .prologue
    const/4 v6, 0x5

    const/4 v2, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x1

    const/4 v5, -0x1

    .line 13
    if-eqz p0, :cond_19

    if-eqz p1, :cond_19

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x100

    if-gt v0, v1, :cond_19

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x80

    if-le v0, v1, :cond_1b

    :cond_19
    move v0, v5

    .line 55
    :goto_1a
    return v0

    .line 14
    :cond_1b
    invoke-static {p0}, LSLSearchFallback;->tokens(Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 15
    invoke-static {p1}, LSLSearchFallback;->tokens(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    .line 16
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3f

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3f

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x20

    if-gt v0, v1, :cond_3f

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_41

    :cond_3f
    move v0, v5

    goto :goto_1a

    .line 17
    :cond_41
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-le v0, v3, :cond_c5

    .line 18
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    new-array v10, v0, [Z

    move v2, v3

    .line 20
    :goto_4e
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-ge v2, v0, :cond_85

    .line 21
    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move v7, v2

    .line 23
    :goto_5b
    if-lez v7, :cond_7e

    add-int/lit8 v1, v7, -0x1

    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    if-ge v1, v11, :cond_7e

    .line 24
    add-int/lit8 v1, v7, -0x1

    invoke-interface {v9, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v9, v7, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 25
    add-int/lit8 v1, v7, -0x1

    move v7, v1

    goto :goto_5b

    .line 27
    :cond_7e
    invoke-interface {v9, v7, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 20
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_4e

    .line 29
    :cond_85
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_89
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 30
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_9f

    move v0, v5

    goto/16 :goto_1a

    :cond_9f
    move v2, v4

    .line 32
    :goto_a0
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    if-ge v2, v1, :cond_147

    .line 33
    aget-boolean v1, v10, v2

    if-nez v1, :cond_bb

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_bb

    .line 35
    :goto_b6
    if-gez v2, :cond_bf

    move v0, v5

    goto/16 :goto_1a

    .line 32
    :cond_bb
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_a0

    .line 36
    :cond_bf
    aput-boolean v3, v10, v2

    goto :goto_89

    :cond_c2
    move v0, v6

    .line 38
    goto/16 :goto_1a

    .line 40
    :cond_c5
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v2, :cond_d4

    move v0, v5

    goto/16 :goto_1a

    .line 42
    :cond_d4
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_d8
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_ed

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d8

    const/4 v0, 0x7

    goto/16 :goto_1a

    .line 45
    :cond_ed
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v6, :cond_101

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v6, 0x20

    if-gt v1, v6, :cond_101

    invoke-static {v0}, LSLSearchFallback;->lettersOnly(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_104

    :cond_101
    move v0, v5

    goto/16 :goto_1a

    .line 46
    :cond_104
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_108
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_144

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 47
    invoke-static {v1}, LSLSearchFallback;->lettersOnly(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_108

    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 50
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 51
    :goto_132
    if-gt v6, v8, :cond_108

    .line 52
    invoke-virtual {v1, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v0, v9}, LSLSearchFallback;->oneEdit(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_141

    move v0, v2

    goto/16 :goto_1a

    .line 51
    :cond_141
    add-int/lit8 v6, v6, 0x1

    goto :goto_132

    :cond_144
    move v0, v5

    .line 55
    goto/16 :goto_1a

    :cond_147
    move v2, v5

    goto/16 :goto_b6
.end method

.method private static tokens(Ljava/lang/String;)Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 78
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    invoke-static {v0, v2}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object v3

    .line 79
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 80
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move v0, v1

    move v2, v1

    .line 82
    :cond_19
    :goto_19
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v0, v6, :cond_69

    .line 83
    invoke-virtual {v3, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v6

    .line 84
    invoke-static {v6}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    add-int/2addr v0, v7

    .line 85
    invoke-static {v6}, Ljava/lang/Character;->getType(I)I

    move-result v7

    .line 86
    const/4 v8, 0x6

    if-eq v7, v8, :cond_36

    const/16 v8, 0x8

    if-eq v7, v8, :cond_36

    const/4 v8, 0x7

    if-ne v7, v8, :cond_42

    .line 88
    :cond_36
    if-nez v2, :cond_19

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_19

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    goto :goto_19

    .line 91
    :cond_42
    invoke-static {v6}, Ljava/lang/Character;->isLetterOrDigit(I)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 92
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 93
    invoke-static {v6}, Ljava/lang/Character$UnicodeScript;->of(I)Ljava/lang/Character$UnicodeScript;

    move-result-object v2

    sget-object v6, Ljava/lang/Character$UnicodeScript;->LATIN:Ljava/lang/Character$UnicodeScript;

    if-ne v2, v6, :cond_55

    const/4 v2, 0x1

    goto :goto_19

    :cond_55
    move v2, v1

    goto :goto_19

    .line 95
    :cond_57
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_67

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    :cond_67
    move v2, v1

    .line 96
    goto :goto_19

    .line 99
    :cond_69
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_76

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    :cond_76
    return-object v4
.end method
