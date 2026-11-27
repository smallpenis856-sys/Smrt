.class LSLClockTask$1;
.super Ljava/lang/Object;
.source "SLClockTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLClockTask;->refresh()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLClockTask;

.field final synthetic val$request:I

.field final synthetic val$today:Ljava/lang/String;


# direct methods
.method constructor <init>(LSLClockTask;Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 56
    iput-object p1, p0, LSLClockTask$1;->this$0:LSLClockTask;

    iput-object p2, p0, LSLClockTask$1;->val$today:Ljava/lang/String;

    iput p3, p0, LSLClockTask$1;->val$request:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 13

    .prologue
    const/4 v0, 0x0

    .line 57
    const/4 v6, 0x0

    .line 59
    :try_start_2
    new-instance v8, Lorg/json/JSONArray;

    iget-object v1, p0, LSLClockTask$1;->this$0:LSLClockTask;

    invoke-static {v1}, LSLClockTask;->access$000(LSLClockTask;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "items_json"

    const-string v3, "[]"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 60
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    move v7, v0

    .line 61
    :goto_1b
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v7, v0, :cond_59

    .line 62
    invoke-virtual {v8, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 63
    if-eqz v5, :cond_55

    new-instance v0, LSLTaskChoice$Item;

    const-string v1, "title"

    const-string v2, ""

    invoke-virtual {v5, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "dateKey"

    const-string v3, ""

    invoke-virtual {v5, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "timeText"

    const-string v4, ""

    invoke-virtual {v5, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "type"

    const/4 v10, 0x2

    invoke-virtual {v5, v4, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    const-string v10, "completed"

    const/4 v11, 0x0

    invoke-virtual {v5, v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-direct/range {v0 .. v5}, LSLTaskChoice$Item;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    :cond_55
    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_1b

    .line 65
    :cond_59
    iget-object v0, p0, LSLClockTask$1;->val$today:Ljava/lang/String;

    invoke-static {v9, v0}, LSLTaskChoice;->select(Ljava/util/List;Ljava/lang/String;)LSLTaskChoice$Item;
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_5e} :catch_6e

    move-result-object v0

    .line 68
    :goto_5f
    iget-object v1, p0, LSLClockTask$1;->this$0:LSLClockTask;

    invoke-static {v1}, LSLClockTask;->access$600(LSLClockTask;)Landroid/os/Handler;

    move-result-object v1

    new-instance v2, LSLClockTask$1$1;

    invoke-direct {v2, p0, v0}, LSLClockTask$1$1;-><init>(LSLClockTask$1;LSLTaskChoice$Item;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 80
    return-void

    .line 66
    :catch_6e
    move-exception v0

    move-object v0, v6

    goto :goto_5f
.end method
