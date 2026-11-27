.class public final LSLGlassEmpty;
.super Ljava/lang/Object;
.implements Lss4;

.field public static final content:Lw12;

.method static constructor <clinit>()V
    .locals 4

    new-instance v0, LSLGlassEmpty;
    invoke-direct {v0}, LSLGlassEmpty;-><init>()V

    new-instance v1, Lw12;
    const/4 v2, 0x0
    const v3, 0x62d45a12
    invoke-direct {v1, v0, v2, v3}, Lw12;-><init>(Ljava/lang/Object;ZI)V
    sput-object v1, LSLGlassEmpty;->content:Lw12;
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    sget-object v0, Lilb;->a:Lilb;
    return-object v0
.end method
