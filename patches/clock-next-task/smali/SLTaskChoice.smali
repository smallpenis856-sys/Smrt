.class public final LSLTaskChoice;
.super Ljava/lang/Object;
.source "SLTaskChoice.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LSLTaskChoice$Item;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static compare(LSLTaskChoice$Item;LSLTaskChoice$Item;)I
    .registers 4

    .prologue
    .line 25
    iget-object v0, p0, LSLTaskChoice$Item;->date:Ljava/lang/String;

    iget-object v1, p1, LSLTaskChoice$Item;->date:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 26
    if-eqz v0, :cond_b

    .line 27
    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, LSLTaskChoice$Item;->time:Ljava/lang/String;

    invoke-static {v0}, LSLTaskChoice;->timeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, LSLTaskChoice$Item;->time:Ljava/lang/String;

    invoke-static {v1}, LSLTaskChoice;->timeKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_a
.end method

.method public static select(Ljava/util/List;Ljava/lang/String;)LSLTaskChoice$Item;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "LSLTaskChoice$Item;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "LSLTaskChoice$Item;"
        }
    .end annotation

    .prologue
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, LSLTaskChoice$Item;

    .line 17
    if-eqz v0, :cond_5

    iget v3, v0, LSLTaskChoice$Item;->type:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_5

    iget-boolean v3, v0, LSLTaskChoice$Item;->completed:Z

    if-nez v3, :cond_5

    iget-object v3, v0, LSLTaskChoice$Item;->title:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, v0, LSLTaskChoice$Item;->title:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, v0, LSLTaskChoice$Item;->date:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, v0, LSLTaskChoice$Item;->date:Ljava/lang/String;

    const-string v4, "[0-9]{4}-[0-9]{2}-[0-9]{2}"

    .line 18
    invoke-virtual {v3, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, v0, LSLTaskChoice$Item;->date:Ljava/lang/String;

    .line 19
    invoke-virtual {v3, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_5

    .line 20
    if-eqz v1, :cond_4a

    invoke-static {v0, v1}, LSLTaskChoice;->compare(LSLTaskChoice$Item;LSLTaskChoice$Item;)I

    move-result v3

    if-gez v3, :cond_4d

    :cond_4a
    :goto_4a
    move-object v1, v0

    .line 21
    goto :goto_5

    .line 22
    :cond_4c
    return-object v1

    :cond_4d
    move-object v0, v1

    goto :goto_4a
.end method

.method private static timeKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 30
    if-eqz p0, :cond_b

    const-string v0, "(?:[01][0-9]|2[0-3]):[0-5][0-9]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    :goto_a
    return-object p0

    :cond_b
    const-string p0, "99:99"

    goto :goto_a
.end method
