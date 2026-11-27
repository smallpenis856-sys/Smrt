.class public final LSLWaPhone;
.super Ljava/lang/Object;
.source "SLWaPhone.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static digits(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    .prologue
    const/16 v6, 0x30

    const/4 v1, 0x0

    .line 16
    if-nez p0, :cond_7

    move-object v0, v1

    .line 26
    :goto_6
    return-object v0

    .line 17
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 18
    const-string v0, "+"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    move-object v0, v1

    goto :goto_6

    .line 19
    :cond_15
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    const/4 v0, 0x1

    :goto_1b
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_47

    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 22
    if-lt v4, v6, :cond_31

    const/16 v5, 0x39

    if-gt v4, v5, :cond_31

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    :cond_2e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    .line 23
    :cond_31
    const/16 v5, 0x20

    if-eq v4, v5, :cond_2e

    const/16 v5, 0x2d

    if-eq v4, v5, :cond_2e

    const/16 v5, 0x28

    if-eq v4, v5, :cond_2e

    const/16 v5, 0x29

    if-eq v4, v5, :cond_2e

    const/16 v5, 0x2e

    if-eq v4, v5, :cond_2e

    move-object v0, v1

    goto :goto_6

    .line 25
    :cond_47
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v2, 0x7

    if-lt v0, v2, :cond_5d

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/16 v2, 0xf

    if-gt v0, v2, :cond_5d

    const/4 v0, 0x0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    if-ne v0, v6, :cond_5f

    :cond_5d
    move-object v0, v1

    goto :goto_6

    .line 26
    :cond_5f
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public static plainNumber(Ljava/lang/String;)Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 5
    if-eqz p0, :cond_d

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 13
    :cond_d
    :goto_d
    return v1

    .line 6
    :cond_e
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    move v0, v1

    .line 7
    :goto_13
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_43

    .line 8
    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 9
    const/16 v4, 0x30

    if-lt v3, v4, :cond_28

    const/16 v4, 0x39

    if-gt v3, v4, :cond_28

    .line 7
    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 10
    :cond_28
    const/16 v4, 0x2b

    if-ne v3, v4, :cond_2e

    if-eqz v0, :cond_25

    .line 11
    :cond_2e
    const/16 v4, 0x20

    if-eq v3, v4, :cond_25

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_25

    const/16 v4, 0x28

    if-eq v3, v4, :cond_25

    const/16 v4, 0x29

    if-eq v3, v4, :cond_25

    const/16 v4, 0x2e

    if-eq v3, v4, :cond_25

    goto :goto_d

    .line 13
    :cond_43
    const/4 v1, 0x1

    goto :goto_d
.end method
