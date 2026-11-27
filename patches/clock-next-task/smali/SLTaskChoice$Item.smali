.class public final LSLTaskChoice$Item;
.super Ljava/lang/Object;
.source "SLTaskChoice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LSLTaskChoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Item"
.end annotation


# instance fields
.field public final completed:Z

.field public final date:Ljava/lang/String;

.field public final time:Ljava/lang/String;

.field public final title:Ljava/lang/String;

.field public final type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V
    .registers 6

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, LSLTaskChoice$Item;->title:Ljava/lang/String;

    iput-object p2, p0, LSLTaskChoice$Item;->date:Ljava/lang/String;

    iput-object p3, p0, LSLTaskChoice$Item;->time:Ljava/lang/String;

    .line 11
    iput p4, p0, LSLTaskChoice$Item;->type:I

    iput-boolean p5, p0, LSLTaskChoice$Item;->completed:Z

    .line 12
    return-void
.end method
